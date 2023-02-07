#!/bin/bash

cd ~;
mkdir $ROM_NAME;
cd $ROM_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";

# Initialize RED source
if [ -z "$ROM_REPO" ];
   then
    echo "ERROR: NO LINK TO ROM SOURCE";
  exit 1;
fi      
if [ -z "$ROM_BRANCH" ];
           then
        repo init -u $ROM_REPO;
    else
  repo init -u $ROM_REPO -b $ROM_BRANCH;
fi

# Sync RED source
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

# Clone GREEN source
if [ -z "$DEVICE_REPO" ];
    then
    echo "ERROR: NO LINK TO DEVICE TREE";
  exit 1;
fi
if [ -z "$DEVICE_BRANCH" ];
   then
      git clone $DEVICE_REPO "device/$OEM/$CODENAME";
    else
  git clone $DEVICE_REPO -b $DEVICE_BRANCH "device/$OEM/$CODENAME";
fi
if [ -z "$VENDOR_REPO" ];
    then
    echo "ERROR: NO LINK TO VENDOR TREE";
  exit 1;
fi
if [ -z "$VENDOR_BRANCH" ];
   then
      git clone $VENDOR_REPO "vendor/$OEM/$CODENAME";
        else
  git clone $VENDOR_REPO -b $VENDOR_BRANCH "vendor/$OEM/$CODENAME";
fi
if [ -z "$KERNEL_REPO" ];
    then 
       echo "ERROR: NO LINK TO KERNEL TREE";
   exit 1;
fi
if [ -z "$KERNEL_BRANCH" && "$TARGET_HAS_COMMON_TREE" = "true" ];
   then
      git clone $KERNEL_REPO "kernel/$OEM/$SOC";
    else
  git clone $KERNEL_REPO -b $KERNEL_BRANCH "kernel/$OEM/$SOC";
fi
if [ -z "$KERNEL_BRANCH" ];
  then 
      git clone $KERNEL_REPO "kernel/$OEM/$CODENAME";
       else
  git clone $KERNEL_REPO -b $KERNEL_BRANCH "kernel/$OEM/$CODENAME";
fi
if [ "$TARGET_HAS_COMMON_TREE" = "true" && -z "$DEVICE_REPO_COM" || -z "$VENDOR_REPO_COM" ];
   then
      echo "ERROR: NO LINK TO EITHER COMMON DEVICE OR COMMON VENDOR TREE";
  exit 1;
fi
if [ "$TARGET_HAS_COMMON_TREE" = "true" && -z "$DEVICE_BRANCH_COM" ];
   then
       git clone $DEVICE_REPO_COM "device/$OEM/$SOC-common";
      elif [ "$TARGET_HAS_COMMON_TREE" = "true" && -z "$VENDOR_BRANCH_COM " ];
           then
               git clone $VENDOR_REPO_COM "vendor/$OEM/$SOC-common";
             elif [ "$TARGET_HAS_COMMON_TREE" = "true" ];
          then
      git clone $DEVICE_REPO_COM -b $DEVICE_BRANCH_COM "device/$OEM/$SOC-common";
    git clone $VENDOR_REPO_COM -b $VENDOR_BRANCH_COM "vendor/$OEM/$SOC-common";
fi
if [ "$TARGET_HAS_HARDWARE_TREE" = "true" && -z $HARDWARE_REPO ];
    then 
       echo "ERROR: NO LINK TO HARDWARE TREE"
   exit 1;
fi
if [ "$TARGET_HAS_HARDWARE_TREE" = "true" && -z $HARDWARE_BRANCH ];
    then
     git clone $HARDWARE_REPO "hardware/$OEM";
fi
if [ "$TARGET_HAS_HARDWARE_TREE" = "true" ];
    then
     git clone $HARDWARE_REPO -b $HARDWARE_BRANCH "hardware/$OEM";
fi
if [ -d "prebuilt/clang/kernel" ];
   then 
      git clone https://github.com/Sanju0910/prebuilts_clang_kernel_linux-x86_clang-r416183b prebuilt/clang/kernel;
fi
if [ -z $EXTRA_REPO ];
    then
     echo "NO EXTRA REPOS FOUND"
        else
    git clone $EXTRA_REPO -b $EXTRA_REPO_BRANCH $EXTRA_REPO_PATH
fi
if [ -z $FIRMWARE_REPO ];
    then
       echo "Device doesn't pack firmware"
         else
   git clone $FIRMWARE_REPO "vendor/$OEM/firmware"
fi
exit 0;
