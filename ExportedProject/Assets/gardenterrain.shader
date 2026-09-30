Shader "DianDian/Garden/Terrain" {
	Properties {
		_Tex1 ("Tex 1", 2D) = "black" {}
		_Tex2 ("Tex 2", 2D) = "black" {}
		_BuildingGround ("BuildingGround", 2D) = "white" {}
		_ControlMap ("Control Map", 2D) = "black" {}
		_SpecularTiling ("Specular Tiling", Vector) = (1,1,0,0)
		_SpecularPower ("Specular Power", Range(0.1, 2048)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_LightDir ("LightDir", Vector) = (0.54,0.74,0.45,0)
		[Header(Stencil)] _Stencil ("Stencil ID", Float) = 1
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