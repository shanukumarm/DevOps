{{/* Helper function to quote values */}}
{{- define "quote" -}}
  {{- printf "%q" . -}}
{{- end -}}

{{/* Helper function to convert bytes to base64 */}}
{{- define "b64enc" -}}
  {{- printf "%s" . | b64enc -}}
{{- end -}}
