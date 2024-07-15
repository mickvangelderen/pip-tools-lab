FROM python:3.11.1 AS python

COPY --link requirements.l0.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.l0.txt

COPY --link requirements.l1.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.l1.txt

COPY --link requirements.l2.txt .

RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked pip install --no-deps -r requirements.l2.txt
