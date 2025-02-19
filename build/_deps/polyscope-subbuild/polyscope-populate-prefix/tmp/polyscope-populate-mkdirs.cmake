# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src")
  file(MAKE_DIRECTORY "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src")
endif()
file(MAKE_DIRECTORY
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build"
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix"
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/tmp"
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/src/polyscope-populate-stamp"
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/src"
  "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/src/polyscope-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/src/polyscope-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-subbuild/polyscope-populate-prefix/src/polyscope-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
