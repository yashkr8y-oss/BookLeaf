
package com.bookleaf.backend.controller;

import com.bookleaf.backend.dto.AuthorResponse;
import com.bookleaf.backend.entity.Author;
import com.bookleaf.backend.service.AuthorService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/authors")
public class AuthorController {

    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping
    public List<AuthorResponse> getAllAuthors() {

        return authorService.getAllAuthors()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    @GetMapping("/{id}")
    public ResponseEntity<AuthorResponse> getAuthorById(
            @PathVariable Long id) {

        return authorService.getAuthorById(id)
                .map(this::toResponse)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    private AuthorResponse toResponse(Author author) {

        return new AuthorResponse(
                author.getAuthorId(),
                author.getFullName(),
                author.getEmail(),
                author.getPhone(),
                author.getCity(),
                author.getJoinedAt()
        );
    }
}
