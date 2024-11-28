{
  pkgs
}:
{
  enable = true;
  package = pkgs.jdk; # Or pkgs.openjdk17, pkgs.graalvm11, etc.
}