#!/bin/bash

echo "- Checking fenrir compatibility patches"
cd system/core

PATCH1_APPLIED=false
PATCH2_APPLIED=false

if grep -q 'verified_boot_state == "green"' fs_mgr/libfs_avb/util.cpp 2>/dev/null; then
  PATCH1_APPLIED=true
fi

if grep -q 'FASTBOOT_BYPASS_LOCK_STATE' fastboot/device/utility.cpp 2>/dev/null; then
  PATCH2_APPLIED=true
fi

RET=0

if [ "$PATCH1_APPLIED" = true ] && [ "$PATCH2_APPLIED" = true ]; then
  echo "OK: All fenrir patches already applied"
else
  if [ "$PATCH1_APPLIED" = false ]; then
    echo "Applying patch 1/2: libfs_avb fenrir boot state"
    curl -sL https://raw.githubusercontent.com/MillenniumOSS/patches/refs/heads/sixteen/system/core/0001-libfs_avb-Allow-LKs-patched-with-fenrir-to-boot-on-A.patch | git am || {
      RET=1
      git am --abort >/dev/null 2>&1
    }
  fi
  if [ "$PATCH2_APPLIED" = false ]; then
    echo "Applying patch 2/2: fastbootd bypass lock state"
    curl -sL https://raw.githubusercontent.com/MillenniumOSS/patches/refs/heads/sixteen/system/core/0002-fastbootd-Always-return-false-for-GetDeviceLockStatu.patch | git am || {
      RET=1
      git am --abort >/dev/null 2>&1
    }
  fi
  if [ $RET -eq 0 ]; then
    echo "OK: All fenrir patches applied"
  else
    echo "ERROR: Some patches failed to apply"
  fi
fi

cd ../../
