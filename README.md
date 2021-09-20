# gitops-with-azure

## Notes

Basic template weatherforecast Web API spun up with .net core 5. Added gitignore, Docker support.

Used https://docs.microsoft.com/en-us/azure/container-instances/container-instances-github-action for the push to ACR workflow.

Used https://docs.github.com/en/packages/managing-github-packages-using-github-actions-workflows/publishing-and-installing-a-package-with-github-actions documentation for the nuget package push workflow.

See here for configuring branch protections: https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches

See here for adding automated .Net build and test workflow: https://docs.github.com/en/actions/guides/building-and-testing-net (on push to all branches).
