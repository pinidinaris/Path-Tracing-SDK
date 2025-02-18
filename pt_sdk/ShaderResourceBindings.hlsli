/*
* Copyright (c) 2023, NVIDIA CORPORATION.  All rights reserved.
*
* NVIDIA CORPORATION and its licensors retain all intellectual property
* and proprietary rights in and to this software, related documentation
* and any modifications thereto.  Any use, reproduction, disclosure or
* distribution of this software and related documentation without an express
* license agreement from NVIDIA CORPORATION is strictly prohibited.
*/

#ifndef __SHADER_RESOURCE_BINDINGS_HLSLI__ // using instead of "#pragma once" due to https://github.com/microsoft/DirectXShaderCompiler/issues/3943
#define __SHADER_RESOURCE_BINDINGS_HLSLI__

#include "SampleConstantBuffer.h"

ConstantBuffer<SampleConstants>         g_Const                     : register(b0);
ConstantBuffer<SampleMiniConstants>     g_MiniConst                 : register(b1);

// All outputs are defined here
RWTexture2D<float4>                     u_Output                    : register(u0); // main HDR output

RWTexture2D<float4>                     u_MotionVectors             : register(u5); // used by RTXDI, DLSS/TAA, etc.
RWTexture2D<float>                      u_Depth                     : register(u6); // used by RTXDI, DLSS/TAA, etc.

RWTexture2D<uint4>                      u_StablePlanesHeader        : register(u40);
RWTexture2D<uint4>                      u_PrevStablePlanesHeader    : register(u41);
RWStructuredBuffer<StablePlane>         u_StablePlanesBuffer        : register(u42);
RWStructuredBuffer<StablePlane>         u_PrevStablePlanesBuffer    : register(u43);
RWTexture2D<float4>                     u_StableRadiance            : register(u44);

// this is for debugging viz
RWTexture2D<float4>                     u_DebugVizOutput            : register(u50);
RWStructuredBuffer<DebugFeedbackStruct> u_FeedbackBuffer            : register(u51);
RWStructuredBuffer<DebugLineStruct>     u_DebugLinesBuffer          : register(u52);
RWStructuredBuffer<DeltaTreeVizPathVertex> u_DebugDeltaPathTree     : register(u53);
RWStructuredBuffer<PathPayload>         u_DeltaPathSearchStack      : register(u54);

// ReSTIR GI resources
RWTexture2D<float4>                u_SecondarySurfacePositionNormal : register(u60);
RWTexture2D<float4>                u_SecondarySurfaceRadiance       : register(u61);

#endif // #ifndef __SHADER_RESOURCE_BINDINGS_HLSLI__