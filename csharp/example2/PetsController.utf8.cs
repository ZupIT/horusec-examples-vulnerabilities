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

using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiSample.Models;

namespace WebApiSample.Controllers
{
    #region snippet_Inherit
    [Produces(MediaTypeNames.Application.Json)]
    [Route("[controller]")]
    public class PetsController : MyControllerBase
    #endregion
    {
        private static readonly List<Pet> _petsInMemoryStore = new List<Pet>();

        public PetsController()
        {
            if (_petsInMemoryStore.Count == 0)
            {
                _petsInMemoryStore.Add(
                    new Pet 
                    { 
                        Breed = "Collie", 
                        Id = 1, 
                        Name = "Fido", 
                        PetType = PetType.Dog 
                    });
            }
        }

        [HttpGet]
        public ActionResult<List<Pet>> GetAll() => _petsInMemoryStore;

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Pet> GetById(int id)
        {
            var pet = _petsInMemoryStore.FirstOrDefault(p => p.Id == id);

            #region snippet_ProblemDetailsStatusCode
            if (pet == null)
            {
                return NotFound();
            }
            #endregion

            return pet;
        }

        #region snippet_400And201
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Pet> Create(Pet pet)
        {
            pet.Id = _petsInMemoryStore.Any() ? 
                     _petsInMemoryStore.Max(p => p.Id) + 1 : 1;
            _petsInMemoryStore.Add(pet);

            return CreatedAtAction(nameof(GetById), new { id = pet.Id }, pet);
        }
        #endregion
    }
}