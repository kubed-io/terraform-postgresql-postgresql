{{- $xr   := .observed.composite.resource }}
{{- $spec := $xr.spec }}
{{- $name := $xr.metadata.name }}
---
apiVersion: opentofu.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: {{ $name }}
  annotations:
    gotemplating.fn.crossplane.io/composition-resource-name: provider-config
spec:
  configuration: |
    terraform {
      backend "kubernetes" {
        secret_suffix     = "server-{{ $name }}"
        namespace         = "data"
        in_cluster_config = true
      }
    }
    locals {
      username = trimspace(file("username"))
      password = trimspace(file("password"))
    }
    provider "postgresql" {
      host     = "{{ $spec.host }}"
      port     = {{ $spec.port | default 5432 }}
      username = local.username
      password = local.password
      sslmode  = "{{ $spec.sslmode | default "disable" }}"
    }
  credentials:
  - filename: username
    source: Secret
    secretRef:
      namespace: {{ $spec.credentialsRef.namespace }}
      name: {{ $spec.credentialsRef.name }}
      key: username
  - filename: password
    source: Secret
    secretRef:
      namespace: {{ $spec.credentialsRef.namespace }}
      name: {{ $spec.credentialsRef.name }}
      key: password
