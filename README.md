## certwork

what is done

\/ create main instance
\/ install jenkins
\/ install terraform
\/ install, configure aws; add creds
\/ configure aws ecr
\/ add credentials to jenkins (ssh, aws, ecr)
\/ create dockerfile (use old file from homework)
\/ create ansible playbook
\/ create pipeline:
    \/ terraform pipe for creating aws instances
    \/ start ansible playbook
    \/ get dns names of machines
    \/ start docker on machines
    \/ push docker container to ECR
    \/ pull docker container from ECR