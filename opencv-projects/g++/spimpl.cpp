#include <iostream>
#include <string.h>
#include "utils.h"
#include <stdio.h>
#include <stdint.h>
#include <cmath>
#include <stdlib.h>
using namespace std;



int main()
{
	
	char* path = "/home/lcl/Desktop/projects/opencv-projects/g++/disparity_original.bmp";
	int w = 0, h = 0;

	int newval = 0;
	int maxdiff = 10;
	int maxspecklesize = 50;
	unsigned char* gray = NULL;
	read_gray_from_bitmap(path, &gray, &w, &h);

	struct point
	{
		short x;
		short y;
	}Point, *wbuf;
	int npixels = w*h;	//294400
	size_t bufsize = npixels*(int)(sizeof(int) + sizeof(unsigned char) + sizeof(Point)); //2649600
	unsigned char* _buf = (unsigned char*)malloc(bufsize);

	if (npixels == NULL)
	{
		printf("Load error!\n");

	}
	unsigned char* buf = _buf;
	int dstep = int(w / sizeof(Point));
	int* labels = (int*)buf;
	buf += npixels * sizeof(labels[0]);
	unsigned char* rtype = (unsigned char*)buf;
	wbuf = (struct point*) buf;
	buf += npixels * sizeof(wbuf);
	int curlabel = 0;

	memset(labels, 0, npixels * sizeof(labels[0]));

	for (int i = 0; i < h; i++)
	{
		unsigned char* ds = gray;
		int* ls = labels + w * i;
		for (int j = 0; j < w; j++)
		{
			if (ds[j] != newval)
			{
				if (ls[j])
				{
					if (rtype[ls[j]])
						ds[j] = newval;
				}
				else
				{
					struct point* ws = wbuf;
					curlabel++;
					int count = 0;
					ls[j] = curlabel;

					while (ws >= wbuf)
					{
						count++;
						struct point p = { (short)j, (short)i };

						unsigned char* dpp = &gray[p.y, p.x];
						unsigned char dp = *dpp;
						int* lpp = labels + w * p.y + p.x;

						if (p.y < h - 1 && !lpp[+w] && dpp[+dstep] != newval && std::abs(dp - dpp[+dstep]) <= maxdiff)
						{
							lpp[+w] = curlabel;
							*ws++ = { p.x, p.y + 1 };
						}
						if (p.y > 0 && !lpp[-w] && dpp[-dstep] != newval && std::abs(dp - dpp[-dstep]) <= maxdiff)
						{
							lpp[-w] = curlabel;
							*ws++ = { p.x, p.y - 1 };
						}
						if (p.x < w - 1 && !lpp[+1] && dpp[+1] != newval && std::abs(dp - dpp[+1]) <= maxdiff)
						{
							lpp[+1] = curlabel;
							*ws++ = { p.x + 1, p.y };
						}
						if (p.x > 0 && !lpp[-1] && dpp[-1] != newval && std::abs(dp - dpp[-1]) <= maxdiff)
						{
							lpp[-1] = curlabel;
							*ws++ = { p.x - 1, p.y };
						}
						p = *--ws;
					}
					if (count <= maxspecklesize)
					{
						rtype[ls[j]] = 1;
						ds[j] = (unsigned char)newval;
					}
					else
						rtype[ls[j]] = 0;
				}
			}
		}
	}
	write_gray_to_bitmap("/home/lcl/Desktop/projects/opencv-projects/g++/disparity_filterspeckle.bmp", gray, w, h);

	


	return 0;
}
