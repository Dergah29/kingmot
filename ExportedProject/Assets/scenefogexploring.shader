Shader "DianDian/Scene/Fog Exploring" {
	Properties {
		[NoScaleOffset] _MainTex ("Main", 2D) = "white" {}
		[NoScaleOffset] _MaskTex ("Mask", 2D) = "white" {}
		[NoScaleOffset] _NoiseTex ("Noise", 2D) = "white" {}
		_Color1 ("Color1", Vector) = (1,1,1,1)
		_Color2 ("Color2", Vector) = (1,1,1,1)
		_Tiling ("Tiling(xy: Layer1, zw: Layer2)", Vector) = (1,1,1,1)
		_Speed ("Speed(xy: Speed1, zw: Speed2)", Vector) = (0,0,0,0)
		_Density ("Density", Range(0, 1)) = 1
		_ExploreSpeed ("Explore Speed", Float) = 1
		[HideInInspector] _ExploreStartTime ("Explore Start Time", Float) = 0
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