/*
   Copyright (c) 2020 CNRS
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIEDi
   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
   */
#include <iostream>
#include <string>
#include <random>
#include <vector>
//Command-line parsing
#include <CLI11.hpp>

//Image filtering and I/O
#define cimg_display 0
#include <CImg.h>
#define STB_IMAGE_IMPLEMENTATION
#include <stb_image.h>
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb_image_write.h>

//Global flag to silent verbose messages
bool silent;

std::vector<int> separable_kernel(int size){
    // return a 1D vector representing the gaussian kernel
    // TODO !!
    /*std::vector<int> kernel;*/
    /*std::vector<int> last;*/
    /*for (int i=0; i<size; i++){*/
    /*    kernel.push_back(1);*/
    /*}*/
    /*for (int i=0; i)*/
    std::vector<int> v;
    if (size=3){
         v = {1, 2, 1};
    }
    if (size=5){
         v = {1, 4, 6, 4, 1};
    }
    if (size=7){
         v = {1, 6, 15, 20, 15, 6, 1};
    }
    if (size=9){
         v = {1, 8, 28, 56, 70, 56, 28, 8, 1};
    }
    return v;
}


int main(int argc, char **argv)
{
    CLI::App app{"colorTransfer"};
    std::string sourceImage;
    app.add_option("-s,--source", sourceImage, "Source image")->required()->check(CLI::ExistingFile);;
    std::string outputImage= "output.png";
    app.add_option("-o,--output", outputImage, "Output image")->required();
    double sigma = 3.0;
    app.add_option("--sigma", sigma, "Variance of the Gaussian filter");
    silent = false;
    app.add_flag("--silent", silent, "No verbose messages");
    CLI11_PARSE(app, argc, argv);

    //Image loading
    int width,height, nbChannels;
    unsigned char *source = stbi_load(sourceImage.c_str(), &width, &height, &nbChannels, 0);
    if (!silent) std::cout<< "Source image: "<<width<<"x"<<height<<"   ("<<nbChannels<<")"<< std::endl;

    //Main computation
    std::vector<unsigned char> output(width*height*nbChannels);

    //As an example, we just scan the pixels of the source image
    //and swap the color channels.
    int n = 9;
    std::vector<int> filtre = separable_kernel(5);
    for(auto i = 0 ; i < width ; ++i){
        for(auto j = 0; j < height; ++j){
            auto outputPixel = nbChannels*(width*j +i);
            for (auto k=0; k<nbChannels; k++){
                output[ outputPixel+k ] = source[ outputPixel+k ];
            }
        }
    }


    for (int dir=0; dir<2; dir++){
        for(auto i = 0 ; i < width ; ++i){
            for(auto j = 0; j < height; ++j){
                int meanr = 0;
                int meang = 0;
                int meanb = 0;
                int norm = 0;

                for (auto k=-(n/2); k<=n/2; k++){
                    if (dir==0 && i+k >= 0 && i+k < width){
                        norm += filtre[k];
                        auto Pixel = nbChannels*(width*j + i+k);
                        meanr += filtre[k] * output[ Pixel ];
                        meang += filtre[k] * output[ Pixel+1 ];
                        meanb += filtre[k] * output[ Pixel+2 ];
                    }
                    if (dir==1 && j+k >= 0 && j+k < height){
                        norm += filtre[k];
                        auto Pixel = nbChannels*(width*(j+k) + i);
                        meanr += filtre[k] * output[ Pixel ];
                        meang += filtre[k] * output[ Pixel+1 ];
                        meanb += filtre[k] * output[ Pixel+2 ];
                    }
                }
                auto outputPixel = nbChannels*(width*j +i);
                output[ outputPixel ] = meanr/(norm);
                output[ outputPixel + 1 ] = meang/(norm);
                output[ outputPixel + 2 ] = meanb/(norm);
            }
        }
    }

    //Final export
    if (!silent) std::cout<<"Exporting.."<<std::endl;
    int errcode = stbi_write_png(outputImage.c_str(), width, height, nbChannels, output.data(), nbChannels*width);
    if (!errcode)
    {
        std::cout<<"Error while exporting the resulting image."<<std::endl;
        exit(errcode);
    }

    stbi_image_free(source);
    exit(0);
    }
