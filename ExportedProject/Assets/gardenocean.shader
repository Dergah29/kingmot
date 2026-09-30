Shader "DianDian/Garden/Ocean" {
	Properties {
		[Header(Color)] [NoScaleOffset] _DeepColor ("Deep Color", 2D) = "white" {}
		_DeepColor2 ("Deep Color2", Vector) = (1,1,1,1)
		_WaveRange ("WaveRange", Range(0, 1)) = 0.3
		_WaveCrest ("WaveCrest", Range(0, 1)) = 0.9
		[Header(Normal)] _NormalTex ("Normal", 2D) = "bump" {}
		_NormalUVParam ("Normal UV Move(xy:dir1, zw:dir2)", Vector) = (1,1,1,1)
		_NormalStrength ("Normal Strength", Range(0, 1)) = 1
		[Header(Foam)] _FoamColor ("Foam Color", Vector) = (1,1,1,1)
		[Header(Caustic)] _CausticCol ("Caustic Color", Vector) = (1,1,1,1)
		_CausticSpeed ("Caustic Speed", Range(0, 2)) = 1
		_CausticUVScale ("Caustic UVScale", Range(0, 1)) = 1
		_CausticRange ("Caustic Range", Range(0, 1)) = 0
		_CausticEdge ("Caustic Edge", Range(0, 1)) = 1
		_CausticStrength ("Caustic Strength", Range(0, 10)) = 1
		[Header(Shadow)] _ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		_NLStrength ("NL Strength", Range(0, 1)) = 0.25
		[Header(Stencil)] _Stencil ("Stencil ID", Float) = 1
		_NoiseTex ("Noise", 2D) = "white" {}
		_NoiseSpeed ("NoiseSpeed(z:strength)", Vector) = (1,1,1,0)
		_NoiseSpeed2 ("NoiseSpeed2(z:strength)", Vector) = (1,1,1,0)
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
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

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
}