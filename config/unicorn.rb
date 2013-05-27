worker_processes 1

listen 3333

preload_app true

timeout 30

pid               '/var/www/apps/inventto/shared/pids/unicorn.pid'
stderr_path       '/var/www/apps/inventto/shared/log/unicorn.error.log'
stdout_path       '/var/www/apps/inventto/shared/log/unicorn.out.log'
working_directory '/var/www/apps/inventto/current'
