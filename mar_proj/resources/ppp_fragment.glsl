varying vec4 diffuse;
varying vec4 ambient;
varying vec3 normal;
varying vec3 lightDir;
varying vec3 halfVector;

void main()
{
  vec3 n;
  vec3 halfV;
  
  float NdotL;
  float NdotHV;

  vec4 color = ambient;

  n = normalize(normal);

  NdotL = max( dot(n,lightDir), 0.0 );
  
  if ( NdotL > 0.0 )
  {
    color += diffuse * NdotL;
    halfV  = normalize(halfVector);
    NdotHV = max(dot(n,halfV),0.0);
    color += gl_FrontMaterial.specular * gl_LightSource[0].specular * pow(NdotHV, gl_FrontMaterial.shininess);
  }

  gl_FragColor = color;
  
  gl_FragColor = gl_FrontMaterial.specular * gl_LightSource[0].specular * pow(NdotHV, gl_FrontMaterial.shininess);
  gl_FragColor *= 2.;
}