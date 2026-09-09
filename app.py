from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI(title="Student ML API")


class PredictionRequest(BaseModel):
    features: list[float] = Field(min_length=1)


@app.get("/health")
def health() -> dict[str, str]:
    return {
        "status": "healthy",
        "application_version": "1.1.0",
        "model_version": "model-1",
    }


@app.post("/predict")
def predict(request: PredictionRequest) -> dict[str, int | str]:
    prediction = 1 if sum(request.features) >= 0 else 0
    return {"prediction": prediction, "model_version": "model-0"}
