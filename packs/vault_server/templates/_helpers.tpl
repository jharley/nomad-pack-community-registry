[[- define "full_job_name" -]]
[[- if eq .vault_server.job_name "" -]]
[[- .nomad_pack.pack.name | quote -]]
[[- else -]]
[[- .vault_server.job_name | quote -]]
[[- end -]]
[[- end -]]

[[- define "full_args" -]]
[[- $fullArgs := prepend .vault_server.vault_server_task.additional_cli_args "server" -]]
[[- if ne .vault_server.vault_server_task_config "" ]][[ $fullArgs = append $fullArgs "-config=${NOMAD_TASK_DIR}/config/config.hcl" ]][[- end -]]
[ [[ range $idx, $arg := $fullArgs ]][[if $idx]],[[end]][[ $arg | quote ]][[ end ]] ]
[[- end -]]