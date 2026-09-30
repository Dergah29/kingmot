Shader "DianDian/Terrain/Ice Fossil Sprite" {
	Properties {
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Vector) = (1,1,1,1)
		[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
		[HideInInspector] _RendererColor ("RendererColor", Vector) = (1,1,1,1)
		[HideInInspector] _Flip ("Flip", Vector) = (1,1,1,1)
		[PerRendererData] _AlphaTex ("External Alpha", 2D) = "white" {}
		[PerRendererData] _EnableExternalAlpha ("Enable External Alpha", Float) = 0
		[Header(Ice)] _IceMaskTex ("IceMask(rg:Crack, b:Shallow)", 2D) = "white" {}
		_IceColor ("IceColor", Vector) = (1,1,1,1)
		_ShallowColor ("ShallowColor", Vector) = (1,1,1,1)
		_CrackColor ("CrackColor", Vector) = (1,1,1,1)
		_CrackUnderColor ("CrackUnderColor", Vector) = (1,1,1,1)
		_ShallowTilingAndOffset ("Shallow Tiling And Offset", Vector) = (1,1,0,0)
		_LayerOffset ("Layer Offset(xy:Offset, zw:Strength)", Vector) = (0,0,0,0)
		[Header(Smoothness)] _SmoothnessTex ("Smoothness Tex", 2D) = "black" {}
		_SmoothnessScale ("Smoothness Scale", Range(0, 1)) = 0.5
		_SmoothnessRoughness ("Smoothness Roughness", Range(0, 1)) = 0.02
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_OffsetFactor ("OffsetFactor", Float) = 0
		_OffsetUnits ("OffsetUnits", Float) = 0
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