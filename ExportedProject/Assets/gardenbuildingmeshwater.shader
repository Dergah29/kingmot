Shader "DianDian/Garden/BuildingMeshWater" {
	Properties {
		[Header(Color)] _DeepColor ("DeepColor", Vector) = (1,1,1,1)
		_DeepColor2 ("DeepColor2", Vector) = (1,1,1,1)
		_ShallowColor ("ShallowColor", Vector) = (1,1,1,1)
		_ShallowRange ("ShallowRange", Range(0, 1)) = 0.01
		[Header(Normal)] _NormalTex ("Normal", 2D) = "bump" {}
		_NormalUVParam ("Normal UV Move(xy:dir1, zw:dir2)", Vector) = (1,1,1,1)
		[Header(Wave)] _WaveParamA ("xy:dir, z:amplitude, w:length", Vector) = (0,0,0,0)
		_WaveParamB ("xy:dir, z:amplitude, w:length", Vector) = (0,0,0,0)
		_WaveSpeed ("Speed", Range(0, 4)) = 1
		_WaveSpeed2 ("Speed2", Range(0, 4)) = 1
		_WaveRange ("WaveRange", Range(0, 1)) = 0.3
		_WaveCrest ("WaveCrest", Range(0, 1)) = 0.9
		[Header(Other)] [NoScaleOffset] _MaskTex ("Mask", 2D) = "white" {}
		_NoiseTex ("Noise", 2D) = "white" {}
		_NoiseSpeed ("NoiseSpeed(zw:strengthFade1\2)", Vector) = (1,1,1,0)
		[Header(Edge)] _EdgeColor ("EdgeColor", Vector) = (0,0,0,0)
		_EdgePos ("EdgePos", Range(0, 1)) = 0
		_EdgeRange ("EdgeRange", Range(0, 0.2)) = 0.01
		[Header(Fade)] _FadeColor ("FadeColor", Vector) = (1,1,1,1)
		_FadeSpeed ("FadeSpeed", Range(0, 1)) = 0
		_FadePos ("FadePos", Range(0, 1)) = 0
		_FadeRange ("FadeRange", Range(0, 0.2)) = 0.01
		_FadeTiling ("FadeTiling", Range(0, 10)) = 1
		_FadeWidth ("FadeWidth", Range(0, 0.5)) = 0.01
		[HideInInspector] _Offset ("Offset", Vector) = (1,1,0,0)
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