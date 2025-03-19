// #include "geometrycentral/surface/base_geometry_interface.h"
#include "geometrycentral/surface/manifold_surface_mesh.h"
#include "geometrycentral/surface/meshio.h"
#include "geometrycentral/surface/vertex_position_geometry.h"

#include "polyscope/polyscope.h"
#include "polyscope/surface_mesh.h"
// #include "polyscope/point_cloud.h"

using namespace geometrycentral;
using namespace geometrycentral::surface;

// == Geometry-central data
std::unique_ptr<ManifoldSurfaceMesh> mesh;
std::unique_ptr<VertexPositionGeometry> geometry;




int main(int argc, char **argv) {

    // Initialize polyscope
    polyscope::init();

    // Load mesh
    std::tie(mesh, geometry) = readManifoldSurfaceMesh(argv[1]);

    // Register the mesh with polyscope
    auto obj = polyscope::registerSurfaceMesh("Input obj",
            geometry->inputVertexPositions,
            mesh->getFaceVertexList(),
            polyscopePermutations(*mesh));


    // Question 1
    std::vector<double> f(mesh->nVertices());
    double freq = 10;

    for (Vertex v: mesh->vertices()){
        Vector3 position = geometry->vertexPositions[v.getIndex()];
        f[v.getIndex()] = sin(freq * position.x) + sin(freq * position.y) + sin(freq * position.z);
    }


    obj->addVertexScalarQuantity("f",f);
    
    // Question 2
    // save into buffer face areas and normals
    geometry->requireFaceAreas(); // get area by using geometry->faceAreas[f] where f is the face
    geometry->requireFaceNormals(); // get normal by using geometry->faceNormals[f] where f is the face
    obj->addFaceScalarQuantity("Areas",geometry->faceAreas);
    obj->addFaceVectorQuantity("Normals",geometry->faceNormals);
    
    // Question 3
    std::vector<Vector3> grad(mesh->nFaces());

    for (auto face: mesh->faces()){
        Vector3 g{0.0, 0.0, 0.0};
        for (auto he: face.adjacentHalfedges()){
            Vertex i = he.tailVertex();
            Vertex j = he.tipVertex();
            Vertex k = (he.next()).tipVertex();
            Vector3 op_vect = geometry->vertexPositions[k.getIndex()] - geometry->vertexPositions[j.getIndex()];
            Vector3 vect = cross(geometry->faceNormals[he.face()], op_vect) / (2*geometry->faceAreas[he.face()]);
            g += f[i.getIndex()] * vect;
        }
        grad[face.getIndex()] = g;
    }
    obj->addFaceVectorQuantity("Gradient",grad);
    

    // Question 4
    std::vector<double> div(mesh->nFaces());
    
    for (auto face: mesh->faces()){

    }


    obj->addFaceScalarQuantity("Divergence", div);


    // Give control to the polyscope gui
    polyscope::show();

    return EXIT_SUCCESS;
}
