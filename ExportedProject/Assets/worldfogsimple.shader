Shader "DianDian/World/FogSimple" {
	Properties {
		[NoScaleOffset] _NoiseTex ("Noise", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_Speed ("Speed(xy: Layer1, zw: Layer2)", Vector) = (0,0,0,0)
		_Tiling ("Tiling(xy: Layer1, zw: Layer2)", Vector) = (1,1,1,1)
		_Density ("Density", Range(0, 2)) = 1
		_NoiseAmount ("Noise Amount", Range(0, 2)) = 1
		_Edge ("Edge", Range(0, 0.1)) = 0.01
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