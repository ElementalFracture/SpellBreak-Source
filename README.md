# SpellBreak

## Description

Welcome to the main repository for the reverse engineering efforts of the game SpellBreak. This project aims to provide a collaborative platform for the community to share their findings and work together. Although the project is still in its early stages and not yet ready for public use, our ultimate goal is to revive the game. We plan to obtain the source code, get it running in Unreal Engine, and continue active development as a community-driven, open-source game project.

## Table of Contents

- [SpellBreak](#spellbreak)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Steps to Get Started](#steps-to-get-started)
  - [Handling Large Files](#handling-large-files)
  - [Extra Scripts](#extra-scripts)
  - [Submodules](#submodules)
    - [Initializing Submodules](#initializing-submodules)
    - [Updating Submodules](#updating-submodules)
    - [Cloning with Submodules](#cloning-with-submodules)

## Installation

Instructions on how to install and set up the project.

Some scripts have been provided to aid in setting up this project. Currently, they are available in PowerShell or batch script form, but there are plans to create Python versions for cross-platform compatibility.

### Steps to Get Started

1. **Clone the Repository:**

    ```batch
    git clone https://github.com/ElementalFracture/SpellBreak-Source
    cd SpellBreak-Source
    ```

2. **Set Up Git Hooks:**

    To set up the necessary Git hooks for handling large files and their reassembly, run the following script. If you add new submodules, run this script again to set up the hooks in them as well:

    ```bash
    .\setup\git_hooks.bat
    ```

3. **Reassemble Files:**

    This step is required the first time you clone the repo. Due to the large file sizes, they are stored as split files. This script ensures all files are reassembled correctly:

    ```bash
    .\setup\reassemble_files.bat
    ```

## Handling Large Files

While using the repo, if you have any large files (such as those in the decompiled folder), git will mark them as "untracked" on each commit, even if nothing has changed. Ensure they are added to the staging area before committing. Use git add . to add all changes, or include specific files in the large_files.tracker. Large files will automatically be added to the large_files.tracker as long as they get added to the staging area.

## Extra Scripts

**Pre-Checkout Script:**

Since git doesn't have a pre-checkout hook, run this script manually before checking out different branches to ensure large files are removed and do not interfere with the checkout process:

```bash
.\setup\pre_checkout.bat
```

**Segmented Git Add/commit/push Script:**

This script is used to add, commit, and push files to the repo, when adding a large amount of different files, ensuring that pushes are never larger than 2GB (the GitHub limit). For singular large files, handle them manually as this script cannot yet manage splicing and segmented uploads of such files:

```bash
.\setup\segmented_push.ps1
```

## Submodules

This project uses submodules to optimize the download process, ensuring you only fetch the necessary components.

### Initializing Submodules

To initialize a specific submodule, run the following command:

```bash
git submodule update --init --recursive submodule_name
```

### Updating Submodules

To update all submodules to their latest commit, use:

```bash
git submodule update --recursive --remote
```

### Cloning with Submodules

To clone the repository with all submodules, use the following command:

```bash
git clone --recurse-submodules
```
