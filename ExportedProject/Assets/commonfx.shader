Shader "DianDian/FX/CommonFX" {
	Properties {
		[HDR] _MainCol ("Main Color", Vector) = (1,1,1,1)
		[Toggle] _MainTwoSide ("Main Tow Side", Float) = 0
		[HDR] _MainCol2 ("Main Color2", Vector) = (1,1,1,1)
		_MainTex ("MainTex(RGB:Main Color)(A:Alpha)", 2D) = "white" {}
		_MainTexAngle ("MainTex Angle", Range(0, 360)) = 0
		_MainTexSpeed_U ("MainTex Speed U", Float) = 0
		_MainTexSpeed_V ("MainTex Speed V", Float) = 0
		[Enum(Off, 0, XY, 1, ZW, 3)] _MainTexOffsetCustomData ("MainTex Offset Custom Data", Float) = 0
		_MainTexStrength ("MainTex Strength", Range(0, 10)) = 1
		[Toggle] _MainUseDistort ("Main Use Distort", Float) = 1
		[Toggle] _MainPolar ("Main Use Polar", Float) = 0
		_MainPolarRot ("Main Polar Rot", Float) = 0
		_FinalRGBIndensity ("Final RGB Indensity", Range(0, 30)) = 1
		_FinalRGBPow ("Final RGB Pow", Range(0, 30)) = 1
		_FinalAlphaIndensity ("Final Alpha Indensity", Range(0, 30)) = 1
		_FinalAlphaPow ("Final Alpha Pow", Range(0, 30)) = 1
		[Enum(Off, 0, On, 1)] _UI ("Main Is UI", Float) = 0
		[HDR] _ShadeCol ("Shade Color", Vector) = (0.5,0.5,0.5,1)
		_ShadeRange ("Shade Range", Range(1, 8)) = 1
		[Toggle] _MaskUseDistort ("MaskTex Use Distort", Float) = 0
		[Toggle] _MaskPolar ("MaskTex Use Polar", Float) = 0
		_MaskTex ("MaskTex(RGBA)", 2D) = "white" {}
		_MaskRGBAStrength ("MaskTex RGBA Strength ", Vector) = (0,0,0,1)
		_MaskTexAngle ("MaskTex Angle", Range(0, 360)) = 0
		_MaskTexSpeed_U ("MaskTex Speed U", Float) = 0
		_MaskTexSpeed_V ("MaskTex Speed V", Float) = 0
		[Enum(Off, 0, XY, 1, ZW, 3)] _MaskTexCustomData ("MaskTex Custom Data", Float) = 0
		[Toggle] _DissolveUseDistort ("Dissolve Use Distort", Float) = 0
		[Toggle] _DissolvePolar ("Dissolve Use Polar", Float) = 0
		_DissolveTex ("DissolveTex", 2D) = "white" {}
		_DissolveRGBAStrength ("DissolveTex RGBA Strength", Vector) = (1,0,0,0)
		_DissolveSpeed_U ("Dissolve Speed U", Float) = 0
		_DissolveSpeed_V ("Dissolve Speed V", Float) = 0
		_DissolveSoftClip ("Dissolve Soft Clip", Float) = 15
		[Enum(Off, 0, XY, 1, ZW, 3)] _DissolveTexOffsetCustomData ("DissolveTex Offset Custom Data", Float) = 0
		_DissolveMask ("Dissolve Mask", 2D) = "white" {}
		_DissolveMaskRGBAStrength ("Dissolve Mask RGBA Strength", Vector) = (0,0,0,1)
		_DissolveMaskStrength ("Dissolve Mask Strength", Float) = 1
		[Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _DissolveMaskStrengthCustomData ("Dissolve Mask Strength Custom Data", Float) = 0
		[Toggle] _DistortTexIsNormal ("DistortTex Is Normal", Float) = 0
		[Toggle] _DistortPolar ("Distort Use Polar", Float) = 0
		_DistortTex ("DistortTex", 2D) = "white" {}
		_DistortRGBAStrength ("Distort RGBA Strength(only for not normal)", Vector) = (0,0,0,1)
		_DistortSpeed_U ("Distort Speed U", Range(-1, 1)) = 1
		_DistortSpeed_V ("Distort Speed V", Range(-1, 1)) = 1
		_DistortSpeed ("Distort Speed", Range(-1, 1)) = 0.1
		_DistortNormalScale ("Distort Normal Scale (Only for normal)", Float) = 0.1
		[Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _DistortNormalScaleCustomData ("Distort Normal Scale Custom Data", Float) = 0
		[HDR] _FresnelInsideCol ("Fresnel Inside Color", Vector) = (0,0,0,0)
		[HDR] _FresnelOutsideCol ("Fresnel Outside Color", Vector) = (1,1,1,1)
		_FresnelPow ("Fresnel Pow", Range(0, 5)) = 1
		_GammaFactor ("Gamma Factor", Range(0, 1)) = 1
		[HideInInspector] _GammaChanelRGBA ("Gamma Chanel RGBA", Vector) = (0,0,0,1)
		_VertexOffsetTex ("VertexOffsetTex", 2D) = "white" {}
		_VertexOffsetParam ("VertexOffsetParam(xy:Range, zw:Speed)", Vector) = (-1,1,0,0)
		[Toggle] _UseUIAddAlpha ("UI Add Alpha", Float) = 0
		[Enum(Off, 0, On, 1)] _Fog ("Use Fog", Float) = 0
		[Enum(Off, 0, On, 1)] _Diurnal ("Use Diurnal ", Float) = 0
		_ColorMask ("Color Mask", Float) = 15
		_MoveZ ("Move Z", Range(0, 0.5)) = 0
		[Toggle] _OffVertexColor ("Off Vertex Color", Float) = 0
		[Toggle] _ClipDiscard ("Clip Discard", Float) = 0
		_ClipVal ("Clip Value", Range(0, 1)) = 0
		[Toggle] _SetGray ("SetGray", Float) = 0
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		[Enum(UnityEngine.Rendering.BlendOp)] [HideInInspector] _BlendOp ("Blend Option", Float) = 0
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Src Blend Mode", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Dst Blend Mode", Float) = 1
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 2
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
		[Enum(Off, 0, On, 1)] [HideInInspector] _ZWriteHide ("_ZWriteHide", Float) = 0
		_ZBias ("ZBias", Float) = 0
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _MainTex_ST;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.uv = (input.uv.xy * _MainTex_ST.xy) + _MainTex_ST.zw;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy);
			}

			ENDHLSL
		}
	}
	//CustomEditor "CenturyGame.GameEditor.CommonFXShaderGUI"
}