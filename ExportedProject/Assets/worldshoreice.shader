Shader "DianDian/World/ShoreIce" {
	Properties {
		[NoScaleOffset] _MainTex ("Main Tex", 2D) = "white" {}
		[NoScaleOffset] _MaskTex ("Mask Tex", 2D) = "white" {}
		_IceMaskTex ("Ice Mask Tex", 2D) = "black" {}
		_IceColor1 ("Ice Color 1", Vector) = (1,1,1,1)
		_IceColor2 ("Ice Color 2", Vector) = (1,1,1,1)
		_IceColor3 ("Ice Color 3", Vector) = (1,1,1,1)
		_SmoothnessTex ("Smoothness Tex", 2D) = "white" {}
		_SmoothnessScale ("Smoothness Scale", Range(0, 1)) = 0.5
		_SpecularStrength ("Specular Strength", Range(0, 10)) = 1
		[HideInInspector] _Offset ("_Offset", Vector) = (1,1,0,0)
		[HideInInspector] _Fade ("Fade", Vector) = (0,0,0,0)
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
}