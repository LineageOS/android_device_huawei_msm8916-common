/*
 *
 *  Copyright (c) 2013, The Linux Foundation. All rights reserved.
 *  Not a Contribution, Apache license notifications and license are retained
 *  for attribution purposes only.
 *
 * Copyright (C) 2012 The Android Open Source Project
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H
#include <cutils/properties.h>
#include <string.h>

static inline const char* BtmGetDefaultName()
{
	char product_model[PROPERTY_VALUE_MAX];
	property_get("ro.product.model", product_model, "");

	if (strstr(product_model, "C8817D"))
		return "HUAWEI C8817D";
	if (strstr(product_model, "C8817E"))
		return "HUAWEI C8817E";
	if (strstr(product_model, "G621-TL00"))
		return "HUAWEI G621-TL00";
	if (strstr(product_model, "G620S-UL00"))
		return "HUAWEI G620S-UL00";
	if (strstr(product_model, "G620S-L01"))
		return "HUAWEI G620S-L01";
	if (strstr(product_model, "G620S-L02"))
		return "HUAWEI G620S-L02";
	if (strstr(product_model, "Che1-CL10"))
		return "HUAWEI Che1-CL10";
	if (strstr(product_model, "Che1-CL20"))
		return "HUAWEI Che1-CL20";
	if (strstr(product_model, "Che1-L04"))
		return "HUAWEI Che1-L04";

	return "";
}

#define BTM_DEF_LOCAL_NAME        BtmGetDefaultName()

#define BLE_VND_INCLUDED          TRUE
#define BLUETOOTH_QTI_SW          TRUE
#define BT_CLEAN_TURN_ON_DISABLED TRUE
#define MAX_ACL_CONNECTIONS       7

#endif
