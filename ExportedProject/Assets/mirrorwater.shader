Shader "DianDian/TD/MirrorWater" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_Alpha ("Alpha", Range(0, 1)) = 1
		[Header(Noise)] _NoiseTex ("Noise", 2D) = "white" {}
		_NoiseSpeed ("NoiseSpeed(z:strength)", Vector) = (1,1,1,0)
		_NoiseSpeed2 ("NoiseSpeed2(z:strength)", Vector) = (1,1,1,0)
		[Header(Reflection)] _ReflectionStrength ("Reflection Strength", Range(0, 1)) = 0.7
		_FresnelPower ("Fresnel Power", Range(1, 20)) = 5
		_RefractiveIndexOfAir ("Refractive Index of Air", Range(1, 2)) = 1
		_RefractiveIndexOfWater ("Refractive Index of Water", Range(1, 2)) = 1.333
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