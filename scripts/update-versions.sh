#!/bin/bash

function display_help() {
  readonly script_name="./$(basename "$0")"

  echo "This script updates versions, the 'releaseDate' and the 'release notes' in pom.yml during a release."
  echo "Use for standard final releases only, as it does not distinguish between 'latest' and 'latestFinal' versions."
  echo
  echo "Usage:"
  echo "  $script_name NEW_FINAL_VERSION NEW_SNAPSHOT_VERSION JIRA_RELEASE_NOTES"
  echo "  you can see the release notes for the drools version here: https://issues.redhat.com/projects/DROOLS?selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=released-unreleased"
  echo "  by selecting the drools version"
  echo "  $script_name --help"
}

if [[ $1 == "--help" ]]; then
  display_help
  exit 0
fi

if [[ $# -ne 3 ]]; then
  echo "Illegal number of arguments."
  display_help
  exit 1
fi

readonly new_release="$1"
readonly new_snapshot="$2"
readonly new_releasenotes_number="$3"

readonly release_date=$(date +%Y-%m-%d)

this_script_directory="${BASH_SOURCE%/*}"
if [[ ! -d "$this_script_directory" ]]; then
  this_script_directory="$PWD"
fi
readonly pom_yml_file="$this_script_directory/../data/pom.yml" # locate jbake pom.yml value file
readonly major_version=${new_release::1}

if [[ "$major_version" -ge "8" ]]; then
  sed -i -E "s/releaseDate: [0-9]+-[0-9]+-[0-9]+/releaseDate: $release_date/g" "$pom_yml_file" # change only release date for 8.x series for Drools
  sed -i -E "s/8\.[0-9]+\.[0-9]+\.(Final|Beta[0-9]*|CR[0-9]*)/$new_release/g" "$pom_yml_file" # change only 8.x series
  sed -i -E "s/droolsReleaseNotes: .*/droolsReleaseNotes: https:\/\/issues.jboss.org\/secure\/ReleaseNote.jspa?projectId=12313021\&version=$new_releasenotes_number/g" "$pom_yml_file" # change only release notes for 8.x series and greater
fi

if [[ "$major_version" == "7" ]]; then
  sed -i -E "s/releaseDateV7: [0-9]+-[0-9]+-[0-9]+/releaseDateV7: $release_date/g" "$pom_yml_file" # change only release date for 7.x series for Drools
  sed -i -E "s/7\.[0-9]+\.[0-9]+\.(Final|Beta[0-9]*|CR[0-9]*)/$new_release/g" "$pom_yml_file" # change only 7.x series for Drools
  sed -i -E "s/7\.[0-9]+\.[0-9]+\-SNAPSHOT/$new_snapshot/g" "$pom_yml_file" # change only 7.x series for Drools
  sed -i -E "s/droolsReleaseNotesV7: .*/droolsReleaseNotesV7: https:\/\/issues.jboss.org\/secure\/ReleaseNote.jspa?projectId=12313021\&version=new_releasenotes_number/g" "$pom_yml_file" # change only release notes for 7.x series
fi

# Update antora-playbook.yml to point to the latest release branch of https://github.com/kiegroup/<project>.
# if [[ "$new_release" == *Final* ]]; then
#   readonly antora_playbook_yml_file="$this_script_directory/../optaplanner-website-docs/antora-playbook.yml"
#   readonly version_array=(${new_release//./ })
#   readonly release_branch="${version_array[0]}.${version_array[1]}.x"
#   sed -i -E "s/branches: \[[0-9]+\.[0-9]+\.x\]/branches: [$release_branch]/" "$antora_playbook_yml_file"
# fi