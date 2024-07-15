FROM python:3.11.1 AS python

COPY --link requirements.0.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.0.txt

COPY --link requirements.1.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.1.txt

COPY --link requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.txt
