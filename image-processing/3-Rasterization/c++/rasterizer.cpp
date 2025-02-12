#include <iostream>
#include <string>
#include <random>
#include <vector>
#include <tuple>
//Command-line parsing
#include "CLI11.hpp"

//Image filtering and I/O
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb_image_write.h>

//Global flag to silent verbose messages
bool silent;


class Point {
    public:
        double x, y, z;
        Point(){}
        Point(double posx, double posy, double posz=0){
            x = posx;
            y = posy;
            z = posz;
        }
        bool is_equal(Point p){
            return (x==p.x && y==p.y);
        }
        int orientation(Point p, Point q){
            return ((p.x-q.x)*(p.y-y) - (p.y-q.y)*(p.x-x));
        }
        double dist(Point p){
            auto vectx = x-p.x;
            auto vecty = y-p.y;
            auto vectz = z-p.z;
            return std::sqrt(vectx*vectx + vecty*vecty + vectz*vectz);
        }
        void add(Point p){
            x = x + p.x;
            y = y + p.y;
        }
        void div(int d){
            x = x/d;
            y = y/d;
        }
        
};

class Triangle {
    public:
        Point a, b, c;
        Triangle(){}
        Triangle(Point p, Point q, Point r){
            a = p;
            b = q;
            c = r;
        }
        /*Point bary;*/
        /**/
        /*void init_iso_barycentre(){*/
        /*    bary = a;*/
        /*    bary.add(b);*/
        /*    bary.add(c);*/
        /*    bary.div(3);*/
        /*}*/
        std::tuple<bool,bool> is_inside(Point p){
            auto o1 = p.orientation(a, b);
            auto o2 = p.orientation(b, c);
            auto o3 = p.orientation(c, a);
            
            int thickness = 500;
            bool b1 = ((o1>=0)==(o2>=0)) && ((o2>=0)==(o3>=0));
            bool b2 = (o1>=-thickness && o1<=thickness) ||
                (o2>=-thickness && o2<=thickness) ||
                (o3>=-thickness && o3<=thickness);
            return std::make_tuple(b1, b2);
        }
        double area(){
            double side1 = a.dist(b);
            double side2 = b.dist(c);
            double side3 = c.dist(a);
            double s = (side1+side2+side3)/2;
            return std::sqrt(s * (s - side1) * (s - side2) * (s - side3));
        }
        std::tuple<double,double,double> get_bary_coords(Point p){
            Triangle t1(a, b, p);
            Triangle t2(p, b, c);
            Triangle t3(a, p, c);
            
            double selfarea = area();
            double lambda1 = t1.area() / selfarea;
            double lambda2 = t2.area() / selfarea;
            double lambda3 = t3.area() / selfarea;
            return std::make_tuple(lambda1,lambda2,lambda3);
        }

        std::vector<unsigned char> draw(
                std::vector<unsigned char> input,
                int width,
                int height,
                int nbChannels,
                unsigned char color_r,
                unsigned char color_g,
                unsigned char color_b,
                int mode
                )
        {
            std::vector<unsigned char> output(width*height*nbChannels);
            for(auto i = 0 ; i < width ; ++i)
            {
                for(auto j = 0; j < height; ++j)
                {
                    auto indexPixel = nbChannels*(width*j+i);
                    unsigned char red = input[ indexPixel ];
                    unsigned char green = input[ indexPixel+1 ];
                    unsigned char blue = input[ indexPixel+2 ];
                    Point pxl(i, j); // TODO : connaître le z_index du pixel
                    auto isinside = is_inside(pxl);

                    if (std::get<1>(isinside)&&std::get<0>(isinside)){
                        red = 0;
                        green = 0;
                        blue = 0;
                    } else if (std::get<0>(isinside)){
                        std::tuple<double,double,double> bary_coords = get_bary_coords(pxl);
                        /*std::cout<<std::get<0>(bary_coords)<<std::endl;*/
                        if (mode==1){ // mode 1 : bary coloration
                            red = std::get<0>(bary_coords) * 255;
                            green = std::get<1>(bary_coords) * 255;
                            blue = std::get<2>(bary_coords) * 255;
                        } else {
                            red = color_r;
                            green = color_g;
                            blue = color_b;
                        }
                    }
                    /*if (pxl.is_equal(bary)){*/
                    /*    red = 255;*/
                    /*    green = 0;*/
                    /*    blue = 0;*/
                    /*}*/
                    output[ indexPixel ] = red;
                    output[ indexPixel + 1 ] = green;
                    output[ indexPixel + 2 ] = blue;
                }
            }
            return output;
        }
};


int main(int argc, char **argv)
{
    CLI::App app{"rasterizer"};
    std::string outputImage= "output.png";
    app.add_option("-o,--output", outputImage, "Output image")->required();

    CLI11_PARSE(app, argc, argv);

    //Image loading
    int width=480,height=640, nbChannels=3;
    std::vector<unsigned char> output(width*height*nbChannels);


    for(auto i = 0 ; i < width ; ++i)
    {
        for(auto j = 0; j < height; ++j)
        {   // setup background
            auto indexPixel = nbChannels*(width*j+i);
            unsigned char r = 255;
            unsigned char g = 255;
            unsigned char b = 255;
            output[ indexPixel ] = r;
            output[ indexPixel + 1 ] = g;
            output[ indexPixel + 2 ] = b;
        }
    }
    // points
    Point p1(240, 64, 400);
    Point p2(360, 480, 10);
    Point p3(120, 480, 50);
    Point p4(412, 132, 0);
    Point p5(255, 520, 455);
    Point p6(245, 340, 0);
    Point p7(320, 440, 0);
    // triangles
    Triangle t1(p1, p2, p3);
    Triangle t2(p1, p2, p4);
    Triangle t3(p5, p6, p7);
    // draws
    output = t1.draw(output, width, height, nbChannels, 220, 248, 124, 1);
    /*output = t2.draw(output, width, height, nbChannels, 255, 175, 200, 0);*/
    /*output = t3.draw(output, width, height, nbChannels, 168, 250, 80, 1);*/

    //Final export
    std::cout<<"Exporting.."<<std::endl;
    int errcode = stbi_write_png(outputImage.c_str(), width, height, nbChannels, output.data(), nbChannels*width);
    if (!errcode)
    {
        std::cout<<"Error while exporting the resulting image."<<std::endl;
        exit(errcode);
    }

    exit(0);
}
