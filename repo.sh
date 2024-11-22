#!/bin/bash
 # Diypa571
GITHUB_TOKEN="YOUR_PERSONAL_ACCESS_TOKEN"

 
GITHUB_USERNAME="YOUR_GITHUB_USERNAME"

# Define the array of repository names
REPOS=("repo1" "repo2" "repo3" "repo4")

# Loop through the array and create a private repository for each element
for REPO in "${REPOS[@]}"; do
    echo "Creating repository: $REPO"

    # Make a POST request to GitHub API to create the repository
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"name\": \"$REPO\", \"private\": true}" \
        "https://api.github.com/user/repos")

    if [ "$RESPONSE" -eq 201 ]; then
        echo "Repository '$REPO' created successfully."
    else
        echo "Failed to create repository '$REPO'. Response code: $RESPONSE"
    fi
done
