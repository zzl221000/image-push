#!bin/bash
while IFS= read -r line; do
  if [ !  -z "$line" ]
  then
    lines=($line)
    pkg_i="${lines[0]}"
    ali_i="${lines[1]}"
    podman pull $pkg_i
    podman tag $pkg_i $ali_i
    podman push $ali_i
  fi
done < $1
