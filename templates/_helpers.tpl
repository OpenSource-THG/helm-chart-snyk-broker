{{/* vim: set filetype=mustache: */}}

{{/*
Create a default scoped fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- print .Values.name | trunc 63 -}}
{{- end -}}
