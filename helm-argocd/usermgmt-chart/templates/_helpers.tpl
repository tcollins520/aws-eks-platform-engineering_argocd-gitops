{{/*
Expand the name of the chart.
*/}}
{{- define "usermgmt.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "usermgmt.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "usermgmt.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "usermgmt.selectorLabels" -}}
app.kubernetes.io/name: {{ include "usermgmt.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "usermgmt.labels" -}}
helm.sh/chart: {{ include "usermgmt.chart" . }}
{{ include "usermgmt.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
ConfigMap
*/}}
{{- define "usermgmt.configMapName" -}}
{{ include "usermgmt.fullname" . }}-config
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "usermgmt.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "usermgmt.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Pod Annotations
*/}}
{{- define "usermgmt.podAnnotations" -}}
{{- toYaml .Values.podAnnotations }}
{{- end }}