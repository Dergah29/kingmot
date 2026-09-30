Shader "DianDian/World/Fog Color" {
	Properties {
		[NoScaleOffset] _MaskTex ("Mask Tex", 2D) = "white" {}
		[NoScaleOffset] _NoiseTex ("Noise Tex", 2D) = "black" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_FogColor ("Fog Color", Vector) = (0.2,0.2,0.2,1)
		_FarParam ("Far Param", Vector) = (0,320,1,0.5)
		[Header(Fog)] [KeywordEnum(Off, On)] _Fog ("Use Fog", Float) = 0
		_FogTiling ("Fog Tiling", Range(0.001, 1)) = 0.01
		_Speed ("Move Speed", Vector) = (0,0,0,0)
		[Header(Edge)] [KeywordEnum(Off, Mode1, Mode2)] _Edge ("Use Edge", Float) = 0
		_EdgeTiling ("Edge Tiling", Range(0.01, 1)) = 0.06
		_EdgeCutoff ("Edge Cutoff", Range(0, 1)) = 0.8
		_EdgePower ("Edge Power", Range(0.1, 2)) = 0.5
		_EdgeSpeed ("Edge Speed", Vector) = (0,0,0,0)
		[Header(Alpha)] _AlphaTiling ("Alpha Tiling", Range(0.01, 1)) = 0.1
		_AlphaCutoff ("AlphaCutoff", Range(0.5, 1)) = 0.5
		_AlphaSpeed ("Alpha Speed", Vector) = (0,0,0,0)
		[Header(Shadow)] _ShadowColor ("Shadow Color", Vector) = (0,0,0,1)
		_ShadowOffset ("Shadow Offset", Vector) = (0,0,0,0)
		_Width ("Width", Float) = 1200
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

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 _Color;

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return _Color; // RGBA
			}

			ENDHLSL
		}
	}
}