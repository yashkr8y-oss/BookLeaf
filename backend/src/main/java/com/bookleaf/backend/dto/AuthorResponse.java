
package com.bookleaf.backend.dto;

import java.time.LocalDateTime;

public record AuthorResponse(
        Long authorId,
        String fullName,
        String email,
        String phone,
        String city,
        LocalDateTime joinedAt
) {
}
