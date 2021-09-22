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

using System;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace NetCoreVulnerabilities
{
    public class NetCoreVulnerabilities : ControllerBase
    {
        public void WeakHashingFunction()
        {
            var str = new byte[] { };
            var hashProvider = new SHA1CryptoServiceProvider();
            var hash = hashProvider.ComputeHash(str);
        }

        public void HardcodedPassword()
        {
            var client = new SmtpClient();
            client.Credentials = new NetworkCredential("test@test.com", "testpassword");
            var mm = new MailMessage("test", "test", "test", "test");
            client.Send(mm);
        }

        public void WeakRandomNumberGenerator()
        {
            var rnd = new Random();
            var buffer = new byte[16];
            rnd.NextBytes(buffer);
            BitConverter.ToString(buffer);
        }

        public void CookieWithoutHttpOnlyFlag()
        {
            var cookie = new CookieOptions();
            cookie.Secure = false;
        }
        
        [HttpGet()]
        public string CrossSiteScripting(string myParam)
        {
            return "value " + myParam;
        }
    }
}