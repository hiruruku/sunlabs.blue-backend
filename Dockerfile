# ビルドステージ
FROM golang:1.20 AS builder

# 作業ディレクトリを設定
WORKDIR /app

# go.modとgo.sumをコピー
COPY ./go.mod ./go.mod
COPY . ./
RUN [ -f go.sum ] && cp go.sum go.sum || true

# 依存関係のインストール
RUN go mod tidy
# RUN go get github.com/labstack/echo/v4

# ソースコードをコピー
COPY main.go ./

# アプリケーションのビルド
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main main.go


# 実行ステージ
FROM alpine:latest

# RUN apk --no-cache add ca-certificates
WORKDIR /root/



# 必要なCA証明書をコピー
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# ビルドステージから実行ファイルをコピー
COPY --from=builder /app/main ./



# 実行コマンド
CMD [ "./main"]

# ポートを公開
EXPOSE 1323
