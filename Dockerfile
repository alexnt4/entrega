# Usa una imagen base oficial de Go
FROM golang:1.21-alpine

# Instala las dependencias necesarias para cgo (por ejemplo, sqlite)
RUN apk add --no-cache build-base sqlite-dev

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo go.mod y go.sum para instalar las dependencias
COPY go.mod go.sum ./

# Instala las dependencias
RUN go mod tidy

# Copia el resto de los archivos del proyecto
COPY . .

# Establece la variable de entorno para habilitar cgo
ENV CGO_ENABLED=1

# Expon el puerto que usará la aplicación (ajustar si es necesario)
EXPOSE 8080

# Ejecuta la aplicación cuando se inicie el contenedor
CMD ["go", "run", "main.go"]
