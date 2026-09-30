Shader "KingshotRepair/CartoonBuildV6"
{
    Properties
    {
        _BaseMap ("Base Map", 2D) = "white" {}
        _MainTex ("Main Tex", 2D) = "white" {}
        _MiddleMap ("Middle Map", 2D) = "white" {}
        _ShadowMap ("Shadow Map", 2D) = "white" {}
        _MatCapMap ("MatCap Map", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        _MiddleStrength ("Middle Strength", Range(0,1)) = 0
        _MatCapStrength ("MatCap Strength", Range(0,1)) = 0.12
        _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.1
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry" }
        Cull Back
        ZWrite On

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _BaseMap; float4 _BaseMap_ST;
            sampler2D _MainTex;
            sampler2D _MiddleMap;
            sampler2D _ShadowMap;
            sampler2D _MatCapMap;
            fixed4 _Color, _BaseColor;
            float _MiddleStrength, _MatCapStrength, _Cutoff;

            struct appdata {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 nrm : TEXCOORD1;
            };

            v2f vert(appdata v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _BaseMap);
                o.nrm = UnityObjectToWorldNormal(v.normal);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target {
                fixed4 b = tex2D(_BaseMap, i.uv);
                // MainTex is kept as an alias/fallback by the repair script.
                fixed4 mid = tex2D(_MiddleMap, i.uv);
                fixed4 sh = tex2D(_ShadowMap, i.uv);

                fixed3 n = normalize(i.nrm);
                float2 muv = n.xy * 0.5 + 0.5;
                fixed4 mc = tex2D(_MatCapMap, muv);

                fixed3 col = b.rgb * _BaseColor.rgb * _Color.rgb;

                // Do not let missing secondary maps turn the building white.
                col = lerp(col, col * mid.rgb, _MiddleStrength);

                // Treat shadow map as modulation rather than replacement color.
                float shadow = lerp(0.72, 1.0, dot(sh.rgb, fixed3(.3333,.3333,.3333)));
                col *= shadow;

                // Small optional material-cap contribution.
                col = lerp(col, col * (0.75 + mc.rgb * 0.5), _MatCapStrength);

                clip(b.a - _Cutoff);
                return fixed4(col, b.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
