# it's for label defination along pods and services

{{- define "labels" -}}
app: {{ .Release.Name }}
name: {{ .Release.Name }}
{{- end -}}
