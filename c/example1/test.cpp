// Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <sys/time.h>
#include <time.h>
#include <vector>
#include <map>

using namespace std;

int64_t getTime()
{
    struct timeval tval;
    gettimeofday(&tval, NULL);
    return tval.tv_sec * 1000000LL + tval.tv_usec;
}

int main(int argc, const char *argv[])
{
    //file<> fdoc("track_orig.xml");
    string xml_str, json_str;
    ifstream inf;
    ofstream outf;
    ostringstream oss;
    char BOM[4] = {(char)0xEF, (char)0xBB, (char)0xBF, '\0'}; /*BOM String*/
    int64_t start_time, end_time;

    inf.open("test.xml");
    outf.open("test.xml");
    oss.str("");
    oss << inf.rdbuf();
    xml_str = oss.str();
    inf.close();
    start_time = getTime();
    json_str = xml2json(xml_str.c_str());
    end_time = getTime();
    cout << "test: " << end_time - start_time << endl;
    outf << BOM << json_str;
    outf.close();

    inf.open("test.xml");
    outf.open("test.xml");
    oss.str("");
    oss << inf.rdbuf();
    xml_str = oss.str();
    inf.close();
    start_time = getTime();
    json_str = xml2json(xml_str.c_str());
    end_time = getTime();
    cout << "test: " << end_time - start_time << endl;
    outf << BOM << json_str;
    outf.close();

    inf.open("test.xml");
    outf.open("test.xml");
    oss.str("");
    oss << inf.rdbuf();
    xml_str = oss.str();
    inf.close();
    start_time = getTime();
    json_str = xml2json(xml_str.c_str());
    end_time = getTime();
    cout << "test: " << end_time - start_time << endl;
    outf << BOM << json_str;
    outf.close();

    return 0;
}
