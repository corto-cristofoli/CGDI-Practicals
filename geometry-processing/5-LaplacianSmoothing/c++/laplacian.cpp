
#include "geometrycentral/surface/manifold_surface_mesh.h"
#include "geometrycentral/surface/meshio.h"
#include "geometrycentral/surface/vertex_position_geometry.h"

#include "polyscope/polyscope.h"
#include "polyscope/surface_mesh.h"
#include "polyscope/point_cloud.h"

using namespace geometrycentral;
using namespace geometrycentral::surface;

// == Geometry-central data
std::unique_ptr<ManifoldSurfaceMesh> mesh;
std::unique_ptr<VertexPositionGeometry> geometry;

int counter=0;


void oneStep(double lambda)
{
    VertexData<Vector3> newpos( *mesh );
    int iterations = 0;

    for(auto vertex: mesh->vertices()){
        /*geometry->vertexPositions[i] = geometry->vertexPositions[i] + Vector3::constant(0.01*sin(i*counter/(2.0*M_PI)));*/

        // compute barycenter
        Vector3 bary{0.0, 0.0, 0.0};
        int N = 0;
        for(auto v: vertex.adjacentVertices()){
            bary += geometry->vertexPositions[v];
            N += 1;
        }
        bary /= N;

        // compute new position
        newpos[vertex] = geometry->vertexPositions[vertex] + lambda * (bary - geometry->vertexPositions[vertex]);
    }
    geometry->vertexPositions = newpos;
}

bool go=false;

void myCallback()
{
    if (ImGui::Button("Go!"))
        go= !go;

    if (go)
    {
        oneStep(0.3);
        oneStep(-0.2);
        polyscope::getSurfaceMesh("Input obj")->updateVertexPositions(geometry->vertexPositions);
        // polyscope::screenshot();
    }
    counter++;
}

void debug(){
    for(auto f: mesh->faces()){
        // do something on the face f
        std::cout<<"\nface "<<f.getIndex()<<": has "<<f.degree()<<" vertices"<<std::endl;
        for(auto v: f.adjacentVertices()){
            // do something on the vertex v of the face f 
            Vector3 coords = geometry->vertexPositions[ v ];
            std::cout<<"   vertex "<<v.getIndex()<<" has position "<<coords<<std::endl;
        }
    }
}

int main(int argc, char **argv) {

    // Initialize polyscope
    polyscope::init();

    // Load mesh
    std::tie(mesh, geometry) = readManifoldSurfaceMesh(argv[1]);

    // Register the mesh with polyscope
    polyscope::registerSurfaceMesh("Input obj",
            geometry->inputVertexPositions,
            mesh->getFaceVertexList(),
            polyscopePermutations(*mesh));


    geometry->requireVertexPositions();

    // Specify the callback
    polyscope::state::userCallback = myCallback;
    
    /*debug();*/
    
    // Give control to the polyscope gui
    polyscope::show();
    return EXIT_SUCCESS;
}
