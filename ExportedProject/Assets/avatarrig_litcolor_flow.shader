Shader "DianDian/Avatar/AvatarRig_LitColor_Flow" {
	Properties {
		[Header(Main)] _Color ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex", 2D) = "white" {}
		[Header(GPU Map)] _RigTex ("Rig Texture", 2D) = "black" {}
		[Header(Flow)] [HDR] _FlowColor ("Flow Color", Vector) = (1,1,1,1)
		_FlowTex ("FlowTex", 2D) = "balck" {}
		[KeywordEnum(Off, On)] _PosUV ("Use Pos UV", Float) = 0
		_FlowSpeed_U ("Flow Speed U", Float) = 0
		_FlowSpeed_V ("Flow Speed V", Float) = 0
		_FlowAngle ("Flow Angle", Range(0, 360)) = 0
		_FlowStrength ("Flow Strength", Range(0, 10)) = 1
		_FlowIndensityRGB ("Flow RGB Indensity", Range(0, 30)) = 1
		_FlowPowRGB ("Flow RGB Pow", Range(0, 30)) = 1
		_FlowIndensityA ("Flow Alpha Indensity", Range(0, 30)) = 1
		_FlowPowA ("Flow Alpha Pow", Range(0, 30)) = 1
		[KeywordEnum(Off, On)] _FlowMask ("Use Flow Mask", Float) = 1
		_FlowMaskTex ("Flow MaskTex", 2D) = "white" {}
		_FlowMaskChannel ("Flow Mask Channel", Vector) = (1,0,0,0)
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
			float4 _Color;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy) * _Color;
			}

			ENDHLSL
		}
	}
}