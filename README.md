# AWS EKS Platform Engineering - ArgoCD GitOps Repository

## Overview

This repository contains the GitOps deployment manifests for the AWS EKS Platform Engineering project.

Instead of deploying applications directly with kubectl or Helm, Argo CD continuously monitors this repository and synchronizes Kubernetes resources into the Amazon EKS cluster.

This repository contains only deployment artifacts.

Application source code is maintained separately.

---

## Architecture
```
GitHub
        │
        ▼
Argo CD
        │
        ▼
Amazon EKS
        │
        ▼
Kubernetes Resources
```
---

## Repository Structure

applications/
    Argo CD Application manifests

helm_argocd/
    Helm charts deployed by Argo CD

projects/
    Argo CD Projects

rollouts/
    Progressive Delivery manifests

docs/
    Architecture and documentation

```
aws-eks-platform-engineering_argocd/
│
├── README.md
│
├── applications/
│   ├── notification.yaml
│   ├── usermgmt.yaml
│   └── app-of-apps.yaml          # later
│
├── projects/
│   └── platform-project.yaml     # later
│
├── helm_argocd/
│   ├── ingress-common/
│   │   ├── values.yaml
│   │   └── values-prod.yaml
│   │
│   ├── notification-chart/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
│   │
│   └── usermgmt-chart/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│
├── rollouts/
│   ├── notification/
│   └── usermgmt/
│
└── docs/
    ├── architecture.md
    ├── deployment-flow.md
    └── troubleshooting.md
```

---

## Technologies

- Amazon EKS 1.34
- Kubernetes
- Helm 3
- Argo CD
- GitOps
- AWS Load Balancer Controller
- AWS Pod Identity
- Karpenter
- Amazon Managed Prometheus
- Amazon Managed Grafana
- OpenTelemetry
- ExternalDNS
- AWS Secrets Manager CSI Driver

---

## GitOps Workflow
```

                    Developer
                         │
                git push main
                         │
                         ▼
        aws-eks-platform-engineering
                         │
                         ▼
                 GitHub Actions
                         │
     ┌───────────────────┼────────────────────┐
     │                   │                    │
     ▼                   ▼                    ▼
 Lint & Test      Security Scan        Build Docker
     │                   │                    │
     └───────────────────┼────────────────────┘
                         │
                         ▼
                 Push Image to ECR
                         │
                         ▼
       Update GitOps Repository (Helm values)
                         │
                         ▼
      aws-eks-platform-engineering_argocd
                         │
                         ▼
                    Git Commit
                         │
                         ▼
                      Argo CD
                         │
                Automatic Sync
                         │
                         ▼
                    Amazon EKS
                         │
                         ▼
              Rolling / Canary Deployment
                         │
                         ▼
            ADOT → AMP → AMG Monitoring
```
---

## Applications

Current workloads:

- notification
- usermgmt

Future workloads:

- catalog
- carts
- checkout
- orders
- ui

---

## Progressive Delivery

This repository will also contain:

- Canary Deployments
- Blue/Green Deployments
- Argo Rollouts
- Analysis Templates
- Traffic Shifting

---

## Platform Features

- Helm Charts
- GitOps Deployments
- Continuous Reconciliation
- Self-Healing Applications
- Automated Synchronization
- Progressive Delivery
- High Availability
- Pod Disruption Budgets
- Horizontal Pod Autoscaling
- Topology Spread Constraints
- Security Contexts

---

## Future Enhancements

- App of Apps Pattern
- ApplicationSets
- Multi-Environment GitOps
- Multi-Cluster Deployments
- Progressive Delivery
- Service Mesh Integration

---

## Author

AWS Platform Engineering Portfolio

Terraform • Kubernetes • Helm • Argo CD • GitOps • Karpenter • HPA • OpenTelemetry • Amazon Managed Prometheus • Amazon Managed Grafana
