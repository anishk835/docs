# Notes for dev setup/runnning app issues related fix

1. Node library installation error message
    ```console
    error ENOTEMPTY: directory not empty, rename ~/node_modules/@wdio/cli -> ~/node_modules/@wdio/.cli-vsGzzxJJ
    ```
    https://discourse.nodered.org/t/unfortunately-no-node-updates-are-possible-for-me/71540

    **Fix:** If you go to the folder ~/node_modules/@wdio/ and delete any folders starting with a dot and then try again, you should be ok.

# Maven
1. It has concept of super pom and it is present in the `maven-model-builder-XY.Z.jar` and the setting can be overridden by the custom setting file.
2. optional dependency is good approach to make implementation independent and the client can select the dependency depending upon their choice.

# Migrate Git SSH to HTTPS
1. Switching remote URLs from SSH to HTTPS using commandline
    - Open Terminal.
    - Change the current working directory to your local project.
    - List your existing remotes in order to get the name of the remote you want to change.
    ```console
        $ git remote -v
        > origin  https://github.com/{sample}/{project}/ (fetch)
        > origin  https://github.com/{sample}/{project}/ (push)
    ```
    - Change your remote's URL from SSH to HTTPS with the git remote set-url command.
    ```console
        $ git remote set-url origin https://github.com/USERNAME/REPOSITORY.git
    ```
    - Verify that the remote URL has changed
    ```console
        $ git remote -v
        # Verify new remote URL
        > origin  https://github.com/{sample}/{project}/ (fetch)
        > origin  https://github.com/{sample}/{project}/ (push)
    ```
2. Then creating a personal access token https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token
3. After that try running below command:
    ```console
        $ git fetch or $ git pull
    ```
    - It will ask your "username" which can be retrived from
    ```console
        $ git config --list
    ```
    - Enter the same username
    - Then enter personal access token created in the previous step 2.

## Git error “fatal: Not possible to fast-forward, aborting”
1. Run command:
    ```console
        $ git pull origin --rebase
    ```
