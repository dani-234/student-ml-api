FROM python:3.11-slim

ARG OCI_SOURCE="https://github.com/dani-234/student-ml-api"
ARG OCI_REVISION="unknown"
ARG OCI_VERSION="unknown"
ARG OCI_CREATED="unknown"

LABEL org.opencontainers.image.source="${OCI_SOURCE}" \
	org.opencontainers.image.revision="${OCI_REVISION}" \
	org.opencontainers.image.version="${OCI_VERSION}" \
	org.opencontainers.image.created="${OCI_CREATED}"

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY VERSION .

EXPOSE 5000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
