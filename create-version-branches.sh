REPOSITORY_URL=$(git remote get-url origin)

LARAVEL_URLS=(
    "https://github.com/laravel/laravel/archive/v4.2.11.tar.gz"
    "https://github.com/laravel/laravel/archive/v5.0.22.tar.gz"
    "https://github.com/laravel/laravel/archive/v5.1.11.tar.gz"
    "https://github.com/laravel/laravel/archive/v5.2.31.tar.gz"
    "https://github.com/laravel/laravel/archive/v5.3.16.tar.gz"
)

for url in ${LARAVEL_URLS[@]}; do
    filename=$(basename ${url})
    major_version=$(echo ${filename} | cut -d'v' -f2 | cut -d'.' -f1)
    minor_version=$(echo ${filename} | cut -d'v' -f2 | cut -d'.' -f2)
    patch_version=$(echo ${filename} | cut -d'v' -f2 | cut -d'.' -f3)
    branch="${major_version}.${minor_version}"
    folder="laravel-${major_version}.${minor_version}.${patch_version}"

    # Download and extract the project skeleton
    wget ${url} -O "${filename}"
    tar xzvf "${filename}"

    pushd "${folder}"
        # Initialize as a new git repository
        git init

        # Add the repository as origin
        git remote add origin ${REPOSITORY_URL}

        # Create a new-unattached branch
        git checkout --orphan ${branch}

        # Commit the project base
        git add --all
        git commit -m 'Initial commit'

        # Add the skeleton Capistrano configuration
        # echo 'no' to avoid the Harrow setup
        echo 'no' | cap install

        # Commit the skeleton Capistrano configuration
        git add --all
        git commit -m 'Added Capistrano configuration files'

        # Upload to the repository and verwrite any existing branch
        git push --force --set-upstream origin ${branch}
    popd

    # Remove the downloaded tar and project files
    rm -rf "${filename}"
    rm -rf "${folder}"
done
