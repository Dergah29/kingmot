Shader "aseShader/snowrongjieEffect" {
	Properties {
		_maintexture ("main texture", 2D) = "white" {}
		[HDR] _Color0 ("Color 0", Vector) = (0.5377358,0.5377358,0.5377358,0.5411765)
		_TextureSample0 ("Texture Sample 0", 2D) = "white" {}
		_rongjie ("rongjie", Range(-1, 1)) = 0.3212083
		_rongjieweizhi ("rongjieweizhi", Vector) = (1,1,0,0)
		_power ("power", Float) = 1.56
		[Toggle(_ZHENGFANG_ON)] _zhengfang ("zhengfang", Float) = 0
		[HDR] _bianyuancolor ("bianyuancolor", Vector) = (0.1273585,0.7653239,1,0.509804)
		_edgpow ("edgpow", Float) = 1
		_ramp ("ramp", 2D) = "white" {}
		_SoftDissolveSoft2 ("SoftDissolveSoft2", Float) = 1
		_SoftDissolveSoft3 ("SoftDissolveSoft3", Float) = 0.1
		_rongjiefanwei ("rongjiefanwei", Float) = 1.21
		[Toggle(_CUSTOMDISS_ON)] _customDiss ("customDiss", Float) = 0
		_toumdu ("toumdu", Range(0, 1)) = 0
		[HideInInspector] _texcoord ("", 2D) = "white" {}
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
	//CustomEditor "ASEMaterialInspector"
}