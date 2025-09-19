# devsecops-microservice
# Secure Microservice - Test repo

This repo contains a tiny Node.js microservice (Express) + Dockerfile and CI pipeline
that demonstrates DevSecOps best practices: multi-stage build, non-root runtime,
static analysis (Semgrep), container scanning (Trivy) and IaC scanning (tfsec).

Quick steps:
1. Add secrets in GitHub Settings -> Secrets:
   - CR_PAT (registry token) and MONGODB_URI
2. Push to `main`. CI will run and block push to registry if HIGH/CRITICAL issues are found.
3. To deploy to Kubernetes, provide KUBECONFIG as a secret and enable deployment step in workflow.

Test purpose only — do not use these secrets in production.
