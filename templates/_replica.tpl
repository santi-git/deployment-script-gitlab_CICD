# It's replica configuration. 
# If we're using hpa, replica will be minReplica of HPA and if no hpa, it would use default one that configured in value file.

{{- define "replica" -}}
{{- if .Values.hpa.required -}}
replicas: {{ default .Values.container.replica .Values.hpa.minReplicas }}
{{- else -}}
replicas: {{ default 1 .Values.container.replica }}
{{- end -}}
{{- end -}}