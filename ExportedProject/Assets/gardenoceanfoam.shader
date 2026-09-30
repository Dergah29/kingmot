Shader "DianDian/Garden/OceanFoam" {
	Properties {
		_WaveNoise ("Wave&Noise", 2D) = "white" {}
		_WaveSpeed ("WaveSpeed", Range(0, 2)) = 1
		_WaveRange ("WaveRange(showMin,showMax,hideMin,hideMax)", Vector) = (0,1,0,1)
		_FadeTex ("FadeTexture", 2D) = "white" {}
		_FadeControl ("FadeControl(cycle,offset2,offset_g,offset_f)", Vector) = (1,3.14,0.5,1)
		_FadeRange ("FadeRange(showMin,showMax,offset_y,hideMin_f)", Vector) = (0,1,0,0)
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